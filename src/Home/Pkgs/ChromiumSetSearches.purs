module Home.Pkgs.ChromiumSetSearches where

import Prelude

import Data.Foldable (fold)
import Home.Pkgs.ChromiumSetSearches.Types as Ty
import Home.Types (Pkgs)
import Home.Utils (doubleTicks, singleTicks)

main :: { pkgs :: Pkgs } -> { | Ty.Pkgs () }
main { pkgs } =
  { chromiumSetSearches
  }
  where
  chromiumSetSearches { entries } =
    let
      exportSql = pkgs.writeText "export.sql" $ fold
        [ "begin transaction; "
        , "delete from keywords; "
        , entries
            <#>
              ( \{ name, shorthand, url } ->
                  fold
                    [ "insert into keywords "
                    , "(short_name, keyword, url, favicon_url) "
                    , "values "
                    , fold
                        [ "("
                        , fold
                            [ singleTicks name
                            , ", "
                            , singleTicks ("@" <> shorthand)
                            , ", "
                            , singleTicks url
                            , ", "
                            , doubleTicks ""
                            ]
                        , ") "
                        ]
                    , ";"
                    ]
              )
            # fold
        , "end transaction;"
        ]
    in
      pkgs.writeShellScriptBin "chromium-set-searches"
        $ fold
            [ pkgs.sqlite <> "/bin/sqlite3"
            , " "
            , doubleTicks "$HOME/.config/chromium/Default/Web Data"
            , " < "
            , exportSql
            ]

