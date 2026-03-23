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
    stylix = {
      url = "github:danth/stylix/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      ...
    }:
    let
      system = "x86_64-linux";
      users = import ./users;
      user = users.hotplugin;
      hosts = import ./hosts { inherit inputs; };
      sharedModules = [
        inputs.mango.nixosModules.mango
        inputs.stylix.nixosModules.stylix
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
            users.${user.username} = import ./users/${user.username}/default.nix;
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
          hostType = hosts.pc.hostType;
          hostModule = hosts.pc.hostModule;
          extraModules = hosts.pc.extraModules;
        };
        laptop = mkHost {
          hostname = "laptop";
          hostType = hosts.laptop.hostType;
          hostModule = hosts.laptop.hostModule;
          extraModules = hosts.laptop.extraModules;
        };
      };
    };
}
