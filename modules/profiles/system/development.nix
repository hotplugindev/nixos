{ lib, config, ... }:
let
  enabled = lib.elem "development" config.gb.host.roles;
in
{
  config = lib.mkIf enabled { };
}
