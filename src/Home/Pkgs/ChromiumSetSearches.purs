module Home.Pkgs.ChromiumSetSearches where

import Prelude

import Data.Foldable (fold)
import Home.Pkgs.ChromiumSetSearches.Types as Ty
import Home.Types (Pkgs)

main :: { pkgs :: Pkgs } -> { | Ty.Pkgs () }
main { pkgs } =
  { chromiumSetSearches
  }
  where
  chromiumSetSearches { entries } =
    let
      exportSql = pkgs.writeText "export.sql" $ fold
        [ "begin transaction;"
        , "delete from keywords;"
        , entries
            <#>
              ( \{ name, shorthand, url } ->
                  fold
                    [ "insert into keywords (short_name, keyword, url, favicon_url) values (\\\'"
                    , name
                    , "', '@"
                    , shorthand
                    , "\\\', \\\'"
                    , url
                    , "\\\', \\\"\\\");"
                    ]
              )
            # fold
        , "end transaction;"
        ]
    in
      pkgs.writeShellScriptBin "chromium-set-searches"
        (pkgs.sqlite <> "\\\"$HOME/.config/chromium/Default/Web Data\\\" < " <> exportSql)

