
let
  module = 
    { "Data.Foldable" = import ../Data.Foldable;
      "Data.Function" = import ../Data.Function;
      "Data.Functor" = import ../Data.Functor;
      "Data.Monoid" = import ../Data.Monoid;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Home.Pkgs.ChromiumSetSearches.Types" = import ../Home.Pkgs.ChromiumSetSearches.Types;
      "Home.Types" = import ../Home.Types;
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
                          [ "begin transaction;"
                            "delete from keywords;"
                            
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
                                        fold ["insert into keywords (short_name, keyword, url, favicon_url) values (\\"
                                        name
                                        "\, \@"
                                        shorthand
                                        "\\, \\"
                                        url
                                        "\\, \"\");"];
                                    __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 21:17 - 30:22";
                                  in
                                    __pattern0 __patternFail
                                )
                              )
                            )
                            "end transaction;"
                          ]
                        );
                    in
                      pkgs.writeShellScriptBin "chromium-set-searches" (append pkgs.sqlite (append "\"$HOME/.config/chromium/Default/Web Data\" < " exportSql));
                __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 14:3 - 37:91";
              in
                __pattern0 __patternFail;
          in
            {chromiumSetSearches = chromiumSetSearches;};
      __patternFail = builtins.throw "Pattern match failure in src/Home/Pkgs/ChromiumSetSearches.purs at 9:1 - 9:45";
    in
      __pattern0 __patternFail;
in
  {inherit main;}