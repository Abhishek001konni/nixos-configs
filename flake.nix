{
  description = "A very basic flake";

  inputs = {
    # UnStable nixpkgs for the NixOS system
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Optional stable nixpkgs
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.05";

    # home-manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland = {
      url = "github:hyprwm/Hyprland/v0.49.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      hyprland,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "abhishek";

      # Custom Overlays
      overlays = import ./overlays { inherit inputs; };

      # Main package set with overlays
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = overlays;
      };

      # Stable package for fallback
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          inherit system;
          pkgs = pkgs;

          specialArgs = {
            inherit inputs pkgs-stable username;
          };

          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${username} = import ./home/default.nix;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                pkgs-stable = pkgs-stable;
                inherit inputs username;
              };
            }
          ];
        };
      };
      # Formatter
      formatter.${system} = pkgs.nixfmt-tree;
    };
}
