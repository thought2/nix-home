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

    # purenix = {
    #   url = "github:purenix-org/purenix/escape-fix";
    #   #inputs.nixpkgs.follows = "nixpkgs";
    # };

    purifix = {
      url = "github:purifix/purifix";
    };

    easy-purescript-nix = {
      url = github:justinwoo/easy-purescript-nix;
      flake = false;
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import
        inputs.nixpkgs
        {
          inherit system;
          inherit overlays;
        };

      easy-purescript-nix = import inputs.easy-purescript-nix { inherit pkgs; };

      overlays = [
        (prev: final: {
          inherit (easy-purescript-nix) purs-tidy psa zephyr purs spago;
          # purenix2 = purenix.defaultPackage.${system};
        })
        (import ./nix/overlay.nix)
        inputs.purifix.overlay
      ];
    in
    {
      homeConfigurations.m = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          inputs.home-priv.home
          ./nix/home.nix
        ] ++ ((import ./output/Home.Modules/default.nix).main { inherit pkgs; });
      };
    };
}
