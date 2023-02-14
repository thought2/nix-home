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
  , sqlite :: String
  , writeText :: String -> String -> String
  , "nixpkgs-fmt" :: String
  , "signal-desktop" :: String
  , "just" :: String
  , "purs-tidy" :: String
  , "psa" :: String
  , "zephyr" :: String
  , "purs" :: String
  , "spago" :: String
  , "yarn" :: String
  , "nodejs" :: String
  , "purenix" :: String
  , "vscodium" :: String
  , "vscode-extensions" ::
      { oderwat :: { "indent-rainbow" :: VSCodeExtension }
      , brettm12345 :: { "nixfmt-vscode" :: VSCodeExtension }
      , b4dm4n :: { "vscode-nixpkgs-fmt" :: VSCodeExtension }
      , "streetsidesoftware" :: { "code-spell-checker" :: VSCodeExtension }
      , "dracula-theme" :: { "theme-dracula" :: VSCodeExtension }
      , "stkb" :: { "rewrap" :: VSCodeExtension }
      , "skellock" :: { "just" :: VSCodeExtension }
      , "haskell" :: { "haskell" :: VSCodeExtension }
      , "tyriar" :: { "sort-lines" :: VSCodeExtension }
      , "jnoortheen" :: { "nix-ide" :: VSCodeExtension }
      , "gruntfuggly" :: { "todo-tree" :: VSCodeExtension }
      , "esbenp" :: { "prettier-vscode" :: VSCodeExtension }
      , "_2gua" :: { "rainbow-brackets" :: VSCodeExtension }
      }
  , "vscode-utils" ::
      { extensionsFromVscodeMarketplace ::
          Array
            { name :: String
            , publisher :: String
            , version :: String
            , sha256 :: String
            }
          -> Array VSCodeExtension
      }
  | ChromiumSetSearches.Pkgs ()
  }

foreign import data VSCodeExtension :: Type

foreign import data RecordSlice :: Row Type -> Type

slice :: forall r r_ r'. Row.Union r r_ r' => Record r -> RecordSlice r'
slice = unsafeCoerce

type HomeConfig =
  RecordSlice
    ( home ::
        RecordSlice
          ( username :: String
          , homeDirectory :: String
          , stateVersion :: String
          , packages :: Array String
          )
    , targets ::
        RecordSlice
          ( genericLinux ::
              RecordSlice
                ( enable :: Boolean
                )
          )
    , nix ::
        RecordSlice
          ( package :: String
          , extraOptions :: String
          )
    , programs ::
        RecordSlice
          ( "home-manager" :: RecordSlice (enable :: Boolean)
          , "bash" :: RecordSlice (enable :: Boolean)
          , "git" :: RecordSlice (enable :: Boolean)
          , "fish" :: RecordSlice (enable :: Boolean)
          , "chromium" ::
              RecordSlice
                ( enable :: Boolean
                , extensions :: Array { id :: String }
                )
          , "vscode" ::
              RecordSlice
                ( enable :: Boolean
                , package :: String
                , extensions :: Array VSCodeExtension
                )
          )
    )

