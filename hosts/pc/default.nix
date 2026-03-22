{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules/common/default.nix
    ../../nixos/modules/profiles/desktop.nix
  ];

  networking.hostName = "pc";
}
