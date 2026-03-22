{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core/default.nix
    ../../modules/system/profiles/laptop.nix
  ];

  networking.hostName = "laptop";
}
