
let
  module = 
    { "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Home.Pkgs.ChromiumSetSearches.Types" = import ../Home.Pkgs.ChromiumSetSearches.Types;
      "Home.Types" = import ../Home.Types;
      "Home.Utils" = import ../Home.Utils;
      "Prelude" = import ../Prelude;
    };
  fold = module."Data.Foldable".fold module."Data.Foldable".foldableArray module."Data.Monoid".monoidString;
  mapFlipped = module."Data.Functor".mapFlipped module."Data.Functor".functorArray;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  main = v: 
    let
      __pattern0 = __fail: 
        let
          pkgs = v.pkgs;
        in
          
          let
            chromiumSetSearches = v1: 
              let
                __pattern0 = __fail: 
                  let
                    entries = v1.entries;
                  in
                    
                    let
                      exportSql = pkgs.writeText "export.sql" 
                        ( fold 
                          [ "begin transaction; "
                            "delete from keywords; "
                            
                            ( fold 
                              ( mapFlipped entries 
                                ( v2: 
                                  let
                                    __pattern0 = __fail: 
                                      let
                                        name = v2.name;
                                        shorthand = v2.shorthand;
                                        url = v2.url;
                                      in
                                        fold ["insert into keywords "
                                        "(short_name, keyword, url, favicon_url) "
                                        "values "
                                        (fold ["("
                                        (fold [(module."Home.Utils".singleTicks name)
                                        ", "
                                        (module."Home.Utils".singleTicks (append "@" shorthand))
                                        ", "
                                        (module."Home.Utils".singleTicks url)
                                        ", "
                                        (module."Home.Utils".doubleTicks "")])
                                        ") "])
                                        ";"];
                                    __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 22:17 - 41:22";
                                  in
                                    __pattern0 __patternFail
                                )
                              )
                            )
                            "end transaction;"
                          ]
                        );
                    in
                      pkgs.writeShellScriptBin "chromium-set-searches" (fold [(append pkgs.sqlite "/bin/sqlite3")
                      " "
                      (module."Home.Utils".doubleTicks "$HOME/.config/chromium/Default/Web Data")
                      " < "
                      exportSql]);
                __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 15:3 - 54:14";
              in
                __pattern0 __patternFail;
          in
            {chromiumSetSearches = chromiumSetSearches;};
      __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 10:1 - 10:45";
    in
      __pattern0 __patternFail;
in
  {inherit main;}