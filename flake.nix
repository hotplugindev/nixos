{
  description = "Giona Berti's NixOS + Home Manager setup";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:mangowm/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      lib = nixpkgs.lib;
      users = import ./users;
      mainUserAttrs = lib.filterAttrs (_: v: v.isMain or false) users;
      mainUser = builtins.head (lib.attrValues mainUserAttrs);

      pkgsUnstableFor =
        system:
        import inputs.nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

      hosts = import ./hosts { inherit inputs; };

      mkHomeManager = hostName: host: {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          backupFileExtension = "backup";
          extraSpecialArgs = {
            inherit
              inputs
              host
              hostName
              users
              ;
            pkgs-unstable = pkgsUnstableFor host.system;
            username = mainUser.username;
            fullName = mainUser.fullName;
            email = mainUser.email;
          };
          users = lib.mapAttrs (
            _name: user:
            { ... }:
            {
              imports = [
                ./modules/aggregate/home.nix
                user.homeModule
                (./hosts + "/${hostName}/home.nix")
              ];

              _module.args = {
                inherit (user) username fullName email;
              };
            }
          ) users;
        };
      };

      mkHost =
        hostName: host:
        lib.nixosSystem {
          system = host.system;
          specialArgs = {
            inherit
              inputs
              host
              hostName
              users
              ;
            username = mainUser.username;
            fullName = mainUser.fullName;
            email = mainUser.email;
            pkgs-unstable = pkgsUnstableFor host.system;
          };
          modules = [
            ./modules/aggregate/nixos.nix
            (./hosts + "/${hostName}")
            inputs.home-manager.nixosModules.home-manager
            (mkHomeManager hostName host)
          ]
          ++ (host.extraModules or [ ]);
        };
    in
    {
      nixosConfigurations = {
        pc = mkHost "pc" (hosts.pc // { name = "pc"; });
        laptop = mkHost "laptop" (hosts.laptop // { name = "laptop"; });
      };
    };
}
