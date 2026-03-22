{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common/default.nix
    ../../modules/system/profiles/laptop.nix
  ];

  networking.hostName = "laptop";
}
