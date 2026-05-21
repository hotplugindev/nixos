{ lib, config, ... }:
let
  enabled = lib.elem "development" config.gb.host.roles;
  requester = "profiles.home.development";
in
{
  config = lib.mkIf enabled {
    gb.requires.home.git = [ requester ];
    gb.requires.home.shell = [ requester ];
  };
}
