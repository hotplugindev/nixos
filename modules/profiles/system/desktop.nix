{ lib, config, ... }:
let
  enabled = lib.elem "desktop" config.gb.host.roles;
  mangoEnabled = config.gb.host.desktop == "mango";
in
{
  config = lib.mkIf enabled {
    gb.desktop.mango.enable = lib.mkDefault mangoEnabled;
  };
}
