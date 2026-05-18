{ lib, ... }:
{
  imports = [
    ./pkg-config.nix
    ./dbus.nix
  ];

  gb.home.tools.packagemanagement.pkg-config.enable = lib.mkDefault true;
  gb.home.tools.packagemanagement.dbus.enable = lib.mkDefault true;
}
