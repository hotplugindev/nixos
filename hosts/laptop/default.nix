{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules/common/default.nix
    ../../nixos/modules/profiles/laptop.nix
  ];

  networking.hostName = "laptop";
}
