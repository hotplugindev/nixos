{
  description = "Giona Berti's NixOS + Home Manager + Mango setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, mango, nixvim, ... }:
    let
      system = "x86_64-linux";
      mkHost = { hostname, hostType, hostModule }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs hostname hostType;
            username = "hotplugin";
            fullName = "Giona Berti";
            email = "giona7berti@gmail.com";
          };
          modules = [
            hostModule
            inputs.mango.nixosModules.mango
            inputs.lanzaboote.nixosModules.lanzaboote
            inputs.home-manager.nixosModules.home-manager
            inputs.nixvim.nixosModules.nixvim
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = {
                  inherit inputs hostname hostType;
                  username = "hotplugin";
                  fullName = "Giona Berti";
                  email = "giona7berti@gmail.com";
                };
                users."hotplugin" = import ./home/hotplugin/default.nix;
              };
            }
          ];
        };
    in {
      nixosConfigurations = {
        pc = mkHost {
          hostname = "pc";
          hostType = "desktop";
          hostModule = ./hosts/pc;
        };
        laptop = mkHost {
          hostname = "laptop";
          hostType = "laptop";
          hostModule = ./hosts/laptop;
        };
      };
    };
}
