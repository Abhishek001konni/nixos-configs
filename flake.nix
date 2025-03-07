{
  description = "A very basic flake";

  inputs = {
    # Stable nixpkgs for the NixOS system
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
     
    # Unstable nixpkgs for user packages
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      ...
    }:
    let 
       system = "x86_64-linux";
       lib = nixpkgs.lib;
       pkgs = nixpkgs.legacyPackages.${system};
       pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
    
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = { pkgs-unstable = pkgs-unstable; };
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
                }; # By default HM using pkgs from nixpkgs
            }
          ];
        };
      };
    };
}
