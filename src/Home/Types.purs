module Home.Types where

import Home.Pkgs.ChromiumSetSearches.Types as ChromiumSetSearches
import Nix (Derivation)
import Prim.Row as Row
import Unsafe.Coerce (unsafeCoerce)

type Pkgs =
  { "writeShellScriptBin" :: String -> String -> Derivation
  , "nixFlakes" :: Derivation
  , "sqlite" :: Derivation
  , "writeText" :: String -> String -> Derivation
  , "nixpkgs-fmt" :: Derivation
  , "signal-desktop" :: Derivation
  , "just" :: Derivation
  , "purs-tidy" :: Derivation
  , "psa" :: Derivation
  , "zephyr" :: Derivation
  , "purs" :: Derivation
  , "spago" :: Derivation
  , "yarn" :: Derivation
  , "nodejs" :: Derivation
  , "purenix" :: Derivation
  , "vscodium" :: Derivation
  , "peek" :: Derivation
  , "byzanz" :: Derivation
  , "esbuild" :: Derivation
  , "tdesktop" :: Derivation
  , "zoom" :: Derivation
  , "miniserve" :: Derivation
  , "esbuild" :: Derivation
  , "thunderbird" :: Derivation
  , "vscode-extensions" ::
      { "oderwat" :: { "indent-rainbow" :: VSCodeExtension }
      , "brettm12345" :: { "nixfmt-vscode" :: VSCodeExtension }
      , "b4dm4n" :: { "vscode-nixpkgs-fmt" :: VSCodeExtension }
      , "streetsidesoftware" :: { "code-spell-checker" :: VSCodeExtension }
      , "dracula-theme" :: { "theme-dracula" :: VSCodeExtension }
      , "stkb" :: { "rewrap" :: VSCodeExtension }
      , "skellock" :: { "just" :: VSCodeExtension }
      , "haskell" :: { "haskell" :: VSCodeExtension }
      , "tyriar" :: { "sort-lines" :: VSCodeExtension }
      , "jnoortheen" :: { "nix-ide" :: VSCodeExtension }
      , "gruntfuggly" :: { "todo-tree" :: VSCodeExtension }
      , "esbenp" :: { "prettier-vscode" :: VSCodeExtension }
      , "2gua" :: { "rainbow-brackets" :: VSCodeExtension }
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
          , packages :: Array Derivation
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
          ( package :: Derivation
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
                , package :: Derivation
                , extensions :: Array VSCodeExtension
                )
          )
    )

