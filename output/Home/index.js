import * as Home_Types from "../Home.Types/index.js";
var partial = /* #__PURE__ */ Home_Types.partial();
var main = function (v) {
    return partial({
        home: partial({
            username: "m",
            homeDirectory: "/home/m",
            stateVersion: "22.11",
            packages: [ v.pkgs.just ]
        }),
        targets: partial({
            genericLinux: partial({
                enable: true
            })
        }),
        nix: partial({
            "package": v.pkgs.nixFlakes,
            extraOptions: "experimental-features = nix-command flakes"
        }),
        programs: partial({
            "home-manager": partial({
                enable: true
            }),
            bash: partial({
                enable: true
            }),
            git: partial({
                enable: true
            }),
            fish: partial({
                enable: true
            })
        })
    });
};
export {
    main
};
