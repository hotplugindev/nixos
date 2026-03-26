{ lib, ... }:
{
  imports = [
    ./gvfs.nix
    ./udisks2.nix
    ./networking.nix
  ];

  gb.system.services.gvfs.enable = lib.mkDefault true;
  gb.system.services.udisks2.enable = lib.mkDefault true;
  gb.system.services.networking.enable = lib.mkDefault true;
}
