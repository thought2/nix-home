var main = function (pkgs) {
    return pkgs.writeShellScriptBin("chromium-set-searches")("echo hello!");
};
export {
    main
};
