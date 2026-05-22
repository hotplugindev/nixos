{ lib, config, ... }:
let
  enabled = lib.elem "gaming" config.gb.host.roles;
in
{
  config = lib.mkIf enabled {
    gb.programs.system.steam.enable = lib.mkDefault true;
  };
}
