switch:
    # spago build
    # git add output/*.nix
    home-manager switch --flake .

update:
    NIXPKGS_ALLOW_BROKEN=1; nix flake update

upgrade: update switch