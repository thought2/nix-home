import * as Home_Types from "../Home.Types/index.js";
var partial = /* #__PURE__ */ Home_Types.partial();
var main = function (v) {
    return partial({
        programs: partial({
            chromium: partial({
                enable: true,
                extensions: [ {
                    id: "cjpalhdlnbpafiamejdnhcphjbkeiagm"
                }, {
                    id: "hdokiejnpimakedhajhdlcegeplioahd"
                }, {
                    id: "aghfnjkcakhmadgdomlmlhhaocbkloab"
                }, {
                    id: "egnjhciaieeiiohknchakcodbpgjnchh"
                } ]
            })
        }),
        home: partial({
            packages: [ v.pkgs.chromiumSetSearches({
                entries: (function () {
                    var mkEntry = function (name) {
                        return function (shorthand) {
                            return function (url) {
                                return {
                                    name: name,
                                    shorthand: shorthand,
                                    url: url
                                };
                            };
                        };
                    };
                    return [ mkEntry("Nix Packages")("np")("https://search.nixos.org/packages?query={searchTerms}"), mkEntry("NixOS Options")("no")("https://search.nixos.org/options?query={searchTerms}"), mkEntry("Nix Flakes")("nf")("https://search.nixos.org/flakes?query={searchTerms}"), mkEntry("Youtube")("yt")("https://www.youtube.com/results?search_query={searchTerms}") ];
                })()
            }) ]
        })
    });
};
export {
    main
};
