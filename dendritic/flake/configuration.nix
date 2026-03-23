{
  inputs,
  ...
}:
let
  nixpkgsLib = inputs.nixpkgs.lib;
  topology = import ../../hosts { inherit inputs; };
in
{
  flake.nixosConfigurations = nixpkgsLib.mapAttrs (
    hostname:
    {
      hostType,
      hostModule,
      extraModules ? [ ],
    }:
    inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        { networking.hostName = hostname; }
        hostModule
        ../../features/system/core.nix
        ../../features/system/hosts/${hostname}.nix
        inputs.mango.nixosModules.mango
        inputs.stylix.nixosModules.stylix
        inputs.home-manager.nixosModules.home-manager
        inputs.nixvim.nixosModules.nixvim
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";
            sharedModules = [
              ../../features/user-environment/context.nix
            ];
            users.hotplugin = import ../../users/hotplugin/default.nix;
          };
        }
      ] ++ extraModules;
    }
  ) topology;
}
