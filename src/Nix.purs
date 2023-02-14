module Nix where

import Prelude

class ToString a where
  toString :: a -> String

instance ToString Derivation where
  toString = toStringImpl

foreign import toStringImpl :: forall a. a -> String

foreign import data Derivation :: Type