module Home.Utils where

import Prelude

foreign import singleTick :: String

foreign import doubleTick :: String

singleTicks :: String -> String
singleTicks str = singleTick <> str <> singleTick

doubleTicks :: String -> String
doubleTicks str = doubleTick <> str <> doubleTick