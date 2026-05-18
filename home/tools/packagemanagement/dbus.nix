{
  lib,
  config,
  pkgs,
  ...
}:
let
  dbus = config.gb.home.tools.packagemanagement.dbus;
in
{
  options = {
    gb.home.tools.packagemanagement.dbus.enable = lib.mkEnableOption "Enable brave web browser";
  };

  config = lib.mkIf dbus.enable {
    home.packages = [
      pkgs.dbus
    ];
  };
}
