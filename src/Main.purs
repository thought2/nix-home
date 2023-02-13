module Main where

import Prelude

import Data.Foldable (foldr)
import Data.Maybe (Maybe(..))

myNames :: String
myNames =
  foldr (\name accum -> name <> " " <> accum) "" ["Eelco", "Jon", "Graham"]