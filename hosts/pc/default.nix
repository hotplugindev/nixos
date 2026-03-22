{ ... }:
{
  imports = [
    ../../hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/desktop.nix
  ];

  networking.hostName = "pc";
}
