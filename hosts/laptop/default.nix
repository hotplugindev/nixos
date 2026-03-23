{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules/shared/core/base.nix
    ../../nixos/modules/hosts/laptop.nix
  ];

  networking.hostName = "laptop";
}
