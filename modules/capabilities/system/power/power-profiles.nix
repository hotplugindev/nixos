{ lib, config, ... }:
let
  requested = config.gb.requires.system.power.profiles != [ ];
in
{
  config = lib.mkIf requested {
    services.power-profiles-daemon.enable = true;
  };
}
