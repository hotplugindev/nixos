{ lib, config, ... }:
let
  enabled = lib.elem "workstation" config.gb.host.roles;
  requester = "profiles.home.workstation";
in
{
  config = lib.mkIf enabled {
    gb.requires.home.networking.kdeconnect = [ requester ];
  };
}
