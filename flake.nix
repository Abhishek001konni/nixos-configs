{
  description = "A very basic flake";

  inputs = {
    # Stable nixpkgs for the NixOS system
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Unstable nixpkgs for user packages
    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-24.11";

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
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
      homeOverlays = import ./home/overlays;
      # Define pkgs-unstable to point to the same nixpkgs (unstable)
      pkgs-unstable = import nixpkgs {
        overlays = [ inputs.hyprpanel.overlay ] ++ homeOverlays;
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      # Define pkgs-stable for the stable channel
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

    in
    {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = {
            pkgs-unstable = pkgs-unstable;
            pkgs-stable = pkgs-stable;
            inherit inputs;
          };
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.abhishek = import ./home/default.nix;
              home-manager.backupFileExtension = "backup";
              home-manager.extraSpecialArgs = {
                pkgs-unstable = pkgs-unstable;
                pkgs-stable = pkgs-stable;
                inherit inputs;
              }; # By default HM using pkgs from nixpkgs
            }
            #overlays
            {
              nixpkgs.overlays = [
                inputs.hyprpanel.overlay
              ];
            }
          ];
        };
      };
    };
}
