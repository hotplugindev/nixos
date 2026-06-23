{ lib, config, ... }:
let
  requested = config.gb.requires.system.networking.kdeconnect != [ ];
in
{
  config = lib.mkIf requested {
    programs.kdeconnect.enable = true;
  };
}
