switch:
    spago build
    git add output/*.nix
    home-manager switch --flake .

update:
    nix flake update

upgrade: update switch