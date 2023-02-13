var main = function (v) {
    return {
        home: {
            username: "m",
            homeDirectory: "/home/m",
            stateVersion: "22.11",
            packages: [ v.pkgs.just ]
        },
        targets: {
            genericLinux: {
                enable: true
            }
        },
        nix: {
            "package": v.pkgs.nixFlakes,
            extraOptions: "experimental-features = nix-command flakes"
        },
        programs: {
            "home-manager": {
                enable: true
            },
            bash: {
                enable: true
            },
            git: {
                enable: true
            },
            fish: {
                enable: true
            }
        }
    };
};
export {
    main
};
