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

    # hyprpanel
    hyprpanel = {
      url = "github:jas-singhfsu/hyprpanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      hyprpanel,
      ...
    }:
    let
      system = "x86_64-linux";
      username = "abhishek";

      # Custom Overlays
      overlays = import ./home/overlays { inherit inputs; };

      # Main package set (unstable)
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = overlays;
      };

      # Stable package set for fallback
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

    in
    {
      nixosConfigurations = {
        nixos = pkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs pkgs-stable;
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
                inherit inputs pkgs-stable;
              };
            }
          ];
        };
      };
    };
}
