var main = function (v) {
    return {
        chromiumSetSearches: function (v1) {
            return v.pkgs.writeShellScriptBin("chromium-set-searches")("echo hello!");
        }
    };
};
export {
    main
};
