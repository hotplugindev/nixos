{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/core/default.nix
    ../../modules/system/profiles/desktop.nix
  ];

  networking.hostName = "pc";
}
