{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules/shared/core/base.nix
    ../../nixos/modules/hosts/pc.nix
  ];

  networking.hostName = "pc";
}
