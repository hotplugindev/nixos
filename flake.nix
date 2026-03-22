{
  description = "Giona Berti's NixOS + Home Manager + Mango setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

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
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      mango,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      user = {
        username = "hotplugin";
        fullName = "Giona Berti";
        email = "giona7berti@gmail.com";
      };
      sharedModules = [
        inputs.mango.nixosModules.mango
        inputs.home-manager.nixosModules.home-manager
        inputs.nixvim.nixosModules.nixvim
      ];
      mkHomeManager = { hostname, hostType }:
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            extraSpecialArgs = {
              inherit inputs hostname hostType;
              inherit (user) username fullName email;
            };
            users.${user.username} = import ./home-manager/users/${user.username}/default.nix;
          };
        };
      mkHost =
        {
          hostname,
          hostType,
          hostModule,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit inputs hostname hostType;
            inherit (user) username fullName email;
          };
          modules = [
            hostModule
          ]
          ++ sharedModules
          ++ [
            (mkHomeManager { inherit hostname hostType; })
          ]
          ++ extraModules;
        };
    in
    {
      nixosConfigurations = {
        pc = mkHost {
          hostname = "pc";
          hostType = "desktop";
          hostModule = ./hosts/pc;
          extraModules = [
            inputs.lanzaboote.nixosModules.lanzaboote
          ];
        };
        laptop = mkHost {
          hostname = "laptop";
          hostType = "laptop";
          hostModule = ./hosts/laptop;
          extraModules = [
            nixos-hardware.nixosModules.framework-13th-gen-intel
          ];
        };
      };
    };
}
