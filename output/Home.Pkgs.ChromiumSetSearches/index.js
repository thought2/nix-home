import * as Data_Foldable from "../Data.Foldable/index.js";
import * as Data_Functor from "../Data.Functor/index.js";
import * as Data_Monoid from "../Data.Monoid/index.js";
var fold = /* #__PURE__ */ Data_Foldable.fold(Data_Foldable.foldableArray)(Data_Monoid.monoidString);
var mapFlipped = /* #__PURE__ */ Data_Functor.mapFlipped(Data_Functor.functorArray);
var main = function (v) {
    var chromiumSetSearches = function (v1) {
        var exportSql = v.pkgs.writeText("export.sql")(fold([ "begin transaction;", "delete from keywords;", fold(mapFlipped(v1.entries)(function (v2) {
            return fold([ "insert into keywords (short_name, keyword, url, favicon_url) values (\\'", v2.name, "', '@", v2.shorthand, "\\', \\'", v2.url, "\\', \\\"\\\");" ]);
        })), "end transaction;" ]));
        return v.pkgs.writeShellScriptBin("chromium-set-searches")(v.pkgs.sqlite + ("\\\"$HOME/.config/chromium/Default/Web Data\\\" < " + exportSql));
    };
    return {
        chromiumSetSearches: chromiumSetSearches
    };
};
export {
    main
};
