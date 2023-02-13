import * as Home_Pkgs_ChromiumSetSearches from "../Home.Pkgs.ChromiumSetSearches/index.js";
var main = function (v) {
    return {
        chromiumSetSearches: (Home_Pkgs_ChromiumSetSearches.main({
            pkgs: v.pkgs
        })).chromiumSetSearches
    };
};
export {
    main
};
