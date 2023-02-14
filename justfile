switch:
    spago build
    git add output/*.nix
    home-manager switch --flake .
