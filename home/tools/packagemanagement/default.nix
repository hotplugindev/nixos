{ lib, ... }:
{
  imports = [
    ./pkg-config.nix
  ];

  gb.home.tools.packagemanagement.pkg-config.enable = lib.mkDefault true;
}
