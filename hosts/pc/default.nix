{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/system/common/default.nix
    ../../modules/system/profiles/desktop.nix
  ];

  networking.hostName = "pc";
}
