{
  description = "My Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-priv = {
      url = "git+ssh://git@github.com/thought2/nix-home-priv.git";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    easy-purescript-nix = {
      url = github:justinwoo/easy-purescript-nix;
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, home-priv, easy-purescript-nix, ... }:
    let
      system = "x86_64-linux";
      pkgs = import
        nixpkgs
        {
          inherit system;
          inherit overlays;
        };

      easy-purescript-nix_ = import easy-purescript-nix { inherit pkgs; };

      overlays = [
        (prev: final: {
          inherit (easy-purescript-nix_) purs-tidy psa zephyr purs spago;
        })
        (import ./nix/overlay.nix)
      ];
    in
    {
      homeConfigurations.m = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./nix/home.nix
          ./nix/vscode.nix
          ./nix/chromium.nix
          ./nix/packages.nix
          home-priv.home
        ];
      };
    };
}
