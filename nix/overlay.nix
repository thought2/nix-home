prev: final:
let
  pkgs = final;
in
{
  chromium-set-searches = (import ./output/Home/Pkgs.ChromiumSetSearches/default.nix).main;

  chromium-set-searches' = entries:
    let
      inherit (pkgs) lib;
      inherit (lib) pipe concatStringsSep;

      export-sql =
        let
          mkInsert = { name, shorthand, url }:
            ''
              insert into keywords (short_name, keyword, url, favicon_url) values ('${name}', '@${shorthand}', '${url}', "");
            '';
        in
        pkgs.writeText "export.sql"
          ''
            begin transaction;
            delete from keywords;
            ${pipe entries [(map mkInsert) (concatStringsSep "")]}
            end transaction;
          ''
      ;
    in
    pkgs.writeShellScriptBin "chromium-set-searches" ''
      ${pkgs.sqlite}/bin/sqlite3 "$HOME/.config/chromium/Default/Web Data" < ${export-sql}
    '';
}
